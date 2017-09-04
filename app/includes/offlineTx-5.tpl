<article class="block">
  <!-- Transaction ID -->
  <article class="clearfix">
    <h2 class="col-xs-12"> Step 1b: Generate Confirm Tx Payload </h2>

    <div class="col-sm-6 col-xs-12">
        <label > Transaction ID From Multisig Wallet Contract</label>
        <div class="input-group">
            <input class="form-control" type="text" placeholder="1" id="transaction-id" name="transaction-id"/>
        </div>
    </div>
    <section class="col-xs-12">
      <p>{{customGasMsg}}</p>
    </section>
  </article>

  <section class="col-xs-12 clearfix">
    <a class="btn btn-info" onclick="generateConfirmPayload()">Create</a>
  </section>
    <!-- Confirmation Payload -->
    <div class="col-xs-12 clearfix" id="output-confirm-box" style="display:none">
        <label > Confirmation Payload</label>
        <input class="form-control" id="output-confirm" type="text" placeholder="" readonly="readonly" ng-model="gasPriceDec"/>
    </div>
  <script>
    var generateConfirmPayload = function () {
        var web3 = new Web3()

        var address, txid
        try {
            txid = document.getElementById("transaction-id").value
        } catch (e) {
            console.dir(e)
        }

        var multiSigABI = multisigwallet.abi
        var multisigDef = TruffleContract({abi: multisigwallet.abi})

        // Set the actual instance from the address on the blockchain, so we can communicate with it.
        var contractInst = multisigDef.at("0x1111111111111111111111111111111111111111")

        var output = contractInst.confirmTransaction.request(txid).params[0].data
        document.getElementById("output-confirm").value = output
        document.getElementById("output-confirm-box").style.display = "block"
    }
    </script>
</article>
