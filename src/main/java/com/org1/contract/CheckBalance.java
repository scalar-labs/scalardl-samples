package com.org1.contract;

import com.scalar.dl.ledger.asset.Asset;
import com.scalar.dl.ledger.contract.Contract;
import com.scalar.dl.ledger.database.Ledger;
import com.scalar.dl.ledger.exception.ContractContextException;
import java.util.Optional;
import javax.json.JsonObject;

public class CheckBalance extends Contract {
  private static final String ID_KEY = "id";
  private static final String BALANCE_KEY = "balance";

  @Override
  public JsonObject invoke(Ledger ledger, JsonObject argument, Optional<JsonObject> properties) {
    if (!argument.containsKey(ID_KEY)) {
      throw new ContractContextException("please set " + ID_KEY + " in the argument");
    }

    String assetId = argument.getString(ID_KEY);
    Optional<Asset> asset = ledger.get(assetId);

    if (asset.isPresent()) {
      return asset.get().data();
    }
    return null;
  }
}
