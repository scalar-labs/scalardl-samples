package com.org1.contract;

import com.scalar.dl.ledger.asset.Asset;
import com.scalar.dl.ledger.contract.Contract;
import com.scalar.dl.ledger.database.Ledger;
import com.scalar.dl.ledger.exception.ContractContextException;
import java.util.Optional;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;

public class TransactSavings extends Contract {
  private static final String ID_KEY = "to_id";
  private static final String AMOUNT_KEY = "amount";
  private static final String BALANCE_KEY = "balance";

  @Override
  public JsonObject invoke(Ledger ledger, JsonObject argument, Optional<JsonObject> properties) {
    if (!argument.containsKey(ID_KEY) || !argument.containsKey(AMOUNT_KEY)) {
      throw new ContractContextException(
          "Please set " + ID_KEY + " and " + AMOUNT_KEY + " in the argument");
    }

    String customerId = argument.getString(ID_KEY);
    int amount = argument.getInt(AMOUNT_KEY);

    Optional<Asset> asset = ledger.get(customerId);
    if (!asset.isPresent()) {
      throw new ContractContextException("the specified asset not found.");
    }

    JsonObject data = asset.get().data();
    int savingsBalance = data.getInt(BALANCE_KEY);
    savingsBalance += amount;

    JsonObjectBuilder newData = Json.createObjectBuilder(data);
    newData.add(BALANCE_KEY, savingsBalance);
    ledger.put(customerId, newData.build());

    return null;
  }
}
