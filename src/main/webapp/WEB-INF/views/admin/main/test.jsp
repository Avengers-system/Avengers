<link href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css" rel="stylesheet" media="screen">    
<div class="container">
<div class="process">
    <div class="process-row">
        <div class="process-step">
            <button type="button" class="btn btn-success btn-circle" disabled="disabled"><i class="fa fa-envelope-o fa-3x"></i></button>
            <p>verify work email</p>
        </div>
        <div class="process-step">
            <button type="button" class="btn btn-success btn-circle" disabled="disabled"><i class="fa fa-linkedin fa-3x"></i></button>
            <p>verify linkedin</p>
        </div>
        <div class="process-step">
            <button type="button" class="btn btn-default btn-circle" disabled="disabled"><i class="fa fa-user fa-3x"></i></button>
            <p>complete profile in 10s</p>
        </div> 
         <div class="process-step">
            <button type="button" class="btn btn-default btn-circle" disabled="disabled"><i class="fa fa-flag-checkered fa-3x"></i></button>
            <p>Donezo!</p>
        </div> 
    </div>
</div>
</>
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Complete profile in 10 seconds or less.</legend>
<!-- Text input-->
<div class="control-group">
  <div class="controls">
    <img src="http://api.randomuser.me/portraits/women/76.jpg" alt="Glenda Patterson" class="img-responsive img-circle" width="70px"/>
    <a href="#">Change profile photo</a>
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="textinput">First Name</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="Nicholas (LI Import)" class="input-xlarge required">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput">Last Name</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="Cavet" class="input-xlarge required">
    
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput">Title</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="Strategy Director (Autocomplete)" class="input-xlarge required">
    
  </div>
</div>


<!-- Select Basic -->
<div class="control-group">
  <label class="control-label" for="selectbasic">Company</label>
  <div class="controls">
    <select id="selectbasic" name="selectbasic" class="input-xlarge required">
      <option>LI Company Imported 1</option>
      <option>LI Company Imported 2</option>
    </select>
  </div>
</div>

<!-- Office select only appears when company type is undefined in the vendori database-->
<div class="control-group">
  <label class="control-label" for="selectbasic">Office</label>
  <div class="controls">
    <select id="selectbasic" name="selectbasic" class="input-xlarge required">
      <option>LI Import Office 1 (city)</option>
      <option>LI Import Office 2 (city)</option>
      <option>LI Import Office 3 (city)</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput">Department</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="(Autocomplete filtered by current company)" class="input-xlarge required" title="Find other vendori users in your department.">
    
  </div>
</div>

<!-- User type only appears when company type is undefined in the vendori database-->
<div class="control-group">
  <label class="control-label" for="selectbasic">User Type</label>
  <div class="controls">
    <select id="selectbasic" name="selectbasic" class="input-xlarge required">
<!-- There are still only 3 company types ID(marketer, agency, vendor) the front end uses labels to help users determine the best fit.-->
      <option id="marketer">Marketer</option>
      <option id="agency">Agency</option>
      <option id="agency">Media Agency</option>
      <option id="vendor">Vendor (Publishers, Networks, Research, Tech etc.)</option>
      <option id="other">Trade Association</option>
      <option id="other">Press</option>
      
    </select>
  </div>
</div>

<!-- Select Job Function (Values change depending on user type) -->
<div class="control-group">
  <label class="control-label" for="selectbasic">Job Function</label>
  <div class="controls">
    <select id="selectbasic" name="selectbasic" class="input-xlarge required">
<!-- The signup form uses a select for job function to determine text on signup success page. It's still an auto complete open field on user settings.-->
      <option>Vendor: Marketing</option>
      <option>Vendor: Inside Sales</option>
      <option>Vendor: Outside Sales</option>
      <option>Vendor: Account Management</option>
      <option>Marketer: Brand Management and Marketing Direction</option>
      <option>Marketer: Marketing support: Insights, Innovation, Agency Relations, Procurement, etc. </option>
      <option>Agency: Account Management</option>
      <option>Agency: Strategy and Planning</option>
      <option>Agency: Research</option>
      <option>Agency: Creative</option>
      <option>Agency: External Marketing</option>
      <option>Agency: New Business</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput">Mobile phone</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="placeholder" class="input-xlarge required" title="Your mobile phone is only visible to your current partners with permission.">
    
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput">Work phone</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="placeholder" class="input-xlarge required" title="Your work phone is only visible to your current partners with permission.">
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput">Work Email</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="(LI Import)" class="input-xlarge" disabled>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput">Backup Email</label>
  <div class="controls">
    <input id="textinput" name="textinput" type="text" placeholder="(LI Import)" class="input-xlarge required">
    <p class="help-block">for your security</p>
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="control-group">
  <label class="control-label" for="radios">Phone contact preference</label>
  <div class="controls">
    <label class="radio inline" for="radios-0">
      <input type="radio" name="radios" id="radios-0" value="Mobile Phone">
      Mobile Phone
    </label>
    <label class="radio inline" for="radios-1">
      <input type="radio" name="radios" id="radios-1" value="Work Phone" checked="checked">
      Work Phone
    </label>
  </div>
</div>

<!-- User can enter brands not in Vendori database. Autocomplete with brands. -->
<div class="control-group">
  <label class="control-label" for="textarea">Brands I work on</label>
  <div class="controls">                     
    <textarea id="textarea" name="textarea" class="one-required" title="The more brands you add the more relevant your site experience will be."></textarea>
  </div>
</div>

<!-- User can enter companies not in Vendori database. Autocomplete with companies type = agencies -->
<div class="control-group">
  <label class="control-label" for="textarea">Agencies I work with</label>
  <div class="controls">                     
    <textarea id="textarea" name="textarea" class="one-required" title="Add all of your agency partners to get their latest decks, videos and thought leadership."></textarea>
  </div>
</div>

<!-- User can enter companies not in Vendori database. Autocomplete with companies type = vendor -->
<div class="control-group">
  <label class="control-label" for="textarea">Vendors (and Publishers) I work with</label>
  <div class="controls">                     
    <textarea id="textarea" name="textarea" class="one-required" title="Add all of your vendors so you don't miss out on any new opportunities."></textarea>
  </div>
</div>

<!-- User can enter solutions not in Vendori database. Autocomplete with solutions -->
<div class="control-group">
  <label class="control-label" for="textarea">3+ solutions I need (or provide) for brands</label>
  <div class="controls">                     
    <textarea id="textarea" name="textarea" class="three-required" title="Solutions help match you to new opportunities in your area of focus."></textarea>
  </div>
</div>

<!-- User can enter channels not in Vendori database. Autocomplete with channels. -->
<div class="control-group">
  <label class="control-label" for="textarea">3+ channels I activate in for brands</label>
  <div class="controls">                     
    <textarea id="textarea" name="textarea" class="three-required" title="Channels help match you to new opportunities in your area of focus."></textarea>
  </div>
</div>

<!-- Button -->
<div class="control-group">
  <label class="control-label" for="singlebutton"></label>
  <div class="controls">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Complete Registration!</button>
  </div>
</div>

</fieldset>
</form>
