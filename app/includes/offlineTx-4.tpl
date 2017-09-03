<article class="block">
  <!-- To Address -->
  <article class="clearfix">
    <h2 class="col-xs-12"> Step 2: Submit Transaction to Recipient (Offline Computer) </h2>

    <address-field var-name="tx.contract" name="recipient-submit" id="recipient-submit"></address-field>

    <section class="col-xs-12">
      <p>{{customGasMsg}}</p>
    </section>
  </article>

  <!-- Amount to Send -->
  <article class="clearfix">
    <section class="col-sm-11">
      <label>
        Amount to Send in Ether
      </label>
      <div class="input-group">
        <input class="form-control" type="text" placeholder="1000" id="amount-submit" name="amount-submit"/>
      </div>
    </section>
  </article>
  <section class="col-xs-12 clearfix">
    <a class="btn btn-info" onclick="generateSubmitPayload()">Create</a>
  </section>
    <!-- Submission Payload -->
    <div class="col-xs-12 clearfix" id="output-submit-box" style="display:none">
        <label > Output Payload</label>
        <input class="form-control" id="output-submit" type="text" placeholder="" readonly="readonly" ng-model="gasPriceDec"/>
    </div>
  <script>
    var generateSubmitPayload = function () {
        var recipient, value, web3
        try {
            value = document.getElementById("amount-submit").value
            recipient = document.getElementById("recipient-submit").children[1].children[0].getAttribute('blockie-address')
        } catch (e) {
            console.dir(e)
        }

        web3 = new Web3()

        var valueInWei = web3.utils.toWei(value, 'ether')

        var multiSigABI = multisigwallet.abi
        var multisigDef = TruffleContract({abi: multisigwallet.abi})

        // Fake the address to allow the function to execute
        var contractInst = multisigDef.at('0x1111111111111111111111111111111111111111')
        var output = contractInst.submitTransaction.request(recipient, valueInWei, 0).params[0].data
        document.getElementById("output-submit").value = output
        document.getElementById("output-submit-box").style.display = "block"
    }
    </script>
</article>
