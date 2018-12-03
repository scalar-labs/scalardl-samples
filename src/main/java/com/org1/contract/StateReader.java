package com.org1.contract;

import com.google.gson.JsonObject;
import com.scalar.ledger.asset.Asset;
import com.scalar.ledger.asset.InternalAsset;
import com.scalar.ledger.contract.Contract;
import com.scalar.ledger.exception.AssetRetrievalException;
import com.scalar.ledger.ledger.Ledger;

import java.util.Base64;
import java.util.Optional;

public class StateReader extends Contract {

  @Override
  public JsonObject invoke(Ledger ledger, JsonObject argument, Optional<JsonObject> properties) {
    String assetId = argument.get("asset_id").getAsString();
    JsonObject response = new JsonObject();

    Optional<Asset> asset = null;
    try {
      asset = ledger.get(assetId);
    } catch (AssetRetrievalException e) {
      response.addProperty("error_message", e.getMessage());
      return response;
    }

    InternalAsset internal = (InternalAsset) asset.get();
    response.addProperty("age", internal.age());
    response.add("input", internal.input());
    response.add("output", internal.data());
    response.addProperty("contract_id", internal.contractId());
    response.add("argument", internal.argument());
    Base64.Encoder encoder = Base64.getEncoder();
    response.addProperty("signature", encoder.encodeToString(internal.signature()));
    response.addProperty("prev_hash", encoder.encodeToString(internal.prevHash()));
    response.addProperty("hash", encoder.encodeToString(internal.hash()));
    return response;
  }
}
