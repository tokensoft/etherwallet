<article class="block">
  <!-- To Address -->
  <article class="clearfix">
    <h2 class="col-xs-12"> Step 1a: Generate Submit Tx Payload to Multisig </h2>
  </article>

  <article class="clearfix">
      <section class="col-sm-11">
        <a class="account-help-icon" href="https://myetherwallet.groovehq.com/knowledge_base/topics/what-is-gas" target="_blank" rel="noopener">
          <img src="images/icon-help.svg" class="help-icon" />
          <p class="account-help-text" >21000 is the default gas limit. For multisig put min of 80,000 (will be refunded any not used)</p>
        </a>
        <label> Address to Send ETH </label>
        <input class="form-control" type="text" placeholder="0x3f5CE5FBFe3E9af3971dD833D26bA9b5C936f0bE" id="target-address" name="target-address"/>
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
            console.log('value', value)
            recipient = document.getElementById("target-address").value
            console.log('recipient', recipient)
        } catch (e) {
            console.dir(e)
        }

        web3 = new Web3()

        if(!web3.utils.isAddress(recipient)) {
          document.getElementById("output-submit").value = 'Invalid Address'
          document.getElementById("output-submit-box").style.display = "block"
          return
        }

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
