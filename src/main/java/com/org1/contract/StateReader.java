package com.org1.contract;

import com.fasterxml.jackson.databind.JsonNode;
import com.scalar.dl.ledger.contract.JacksonBasedContract;
import com.scalar.dl.ledger.exception.ContractContextException;
import com.scalar.dl.ledger.statemachine.Asset;
import com.scalar.dl.ledger.statemachine.Ledger;
import java.util.Optional;
import javax.annotation.Nullable;

/**
 * It is recommended to use JacksonBasedContract for taking a good balance between development
 * productivity and performance.
 */
public class StateReader extends JacksonBasedContract {

  @Nullable
  @Override
  public JsonNode invoke(
      Ledger<JsonNode> ledger, JsonNode argument, @Nullable JsonNode properties) {
    if (!argument.has("asset_id")) {
      // ContractContextException is the only throwable exception in a contract and
      // it should be thrown when a contract faces some non-recoverable error
      throw new ContractContextException("please set asset_id in the argument");
    }

    String assetId = argument.get("asset_id").asText();
    Optional<Asset<JsonNode>> asset = ledger.get(assetId);

    return asset
        .map(
            value ->
                (JsonNode)
                    getObjectMapper()
                        .createObjectNode()
                        .put("id", value.id())
                        .put("age", value.age())
                        .set("output", value.data()))
        .orElse(null);
  }
}
