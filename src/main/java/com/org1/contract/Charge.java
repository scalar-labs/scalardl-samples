package com.org1.contract;

import com.scalar.dl.ledger.contract.Contract;
import com.scalar.dl.ledger.database.Ledger;
import com.scalar.dl.ledger.exception.ContractContextException;
import java.util.Optional;
import javax.json.Json;
import javax.json.JsonObject;

public class Charge extends Contract {
  private static final String ID_KEY = "id";
  private static final String AMOUNT_KEY = "amount";
  private static final String BALANCE_KEY = "balance";

  @Override
  public JsonObject invoke(Ledger ledger, JsonObject argument, Optional<JsonObject> properties) {
    if (!argument.containsKey(ID_KEY) || !argument.containsKey(AMOUNT_KEY)) {
      throw new ContractContextException(
          "please set " + ID_KEY + " and " + AMOUNT_KEY + " in the argument");
    }

    JsonObject json =
        Json.createObjectBuilder().add(BALANCE_KEY, argument.getInt(AMOUNT_KEY)).build();

    String assetId = argument.getString(ID_KEY);
    ledger.put(assetId, json);

    return null;
  }
}
