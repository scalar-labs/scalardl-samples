package com.org1.contract;

import com.scalar.dl.ledger.asset.Asset;
import com.scalar.dl.ledger.contract.Contract;
import com.scalar.dl.ledger.database.Ledger;
import com.scalar.dl.ledger.exception.ContractContextException;
import java.util.Optional;
import javax.json.Json;
import javax.json.JsonObject;

public class Pay extends Contract {
  private static final String FROM_ID_KEY = "from_id";
  private static final String TO_ID_KEY = "to_id";
  private static final String AMOUNT_KEY = "amount";
  private static final String BALANCE_KEY = "balance";

  @Override
  public JsonObject invoke(Ledger ledger, JsonObject argument, Optional<JsonObject> properties) {
    if (!argument.containsKey(FROM_ID_KEY)
        || !argument.containsKey(TO_ID_KEY)
        || !argument.containsKey(AMOUNT_KEY)) {
      throw new ContractContextException(
          "please set "
              + FROM_ID_KEY
              + ", "
              + TO_ID_KEY
              + ", and "
              + AMOUNT_KEY
              + " in the argument");
    }

    String fromId = argument.getString(FROM_ID_KEY);
    String toId = argument.getString(TO_ID_KEY);
    int amount = argument.getInt(AMOUNT_KEY);

    Asset from = ledger.get(fromId).get();
    Asset to = ledger.get(toId).get();
    JsonObject fromData = from.data();
    JsonObject toData = to.data();

    int fromBalance = fromData.getInt(BALANCE_KEY);
    int toBalance = toData.getInt(BALANCE_KEY);
    if (fromBalance - amount < 0) {
      throw new ContractContextException("not enough balance in from account");
    }

    ledger.put(
        from.id(),
        Json.createObjectBuilder(fromData).add(BALANCE_KEY, fromBalance - amount).build());
    ledger.put(
        to.id(), Json.createObjectBuilder(toData).add(BALANCE_KEY, toBalance + amount).build());

    return null;
  }
}
