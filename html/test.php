
    <form id="applyForm">
      <div class="form_row">
    <div class="form-group center row col-md-6">
      <input type="text" class="form-control" id="inputFirstname" placeholder="FisrtName" required>
    </div>
    <div class="form-group row col-md-6">
      <input type="text" class="form-control" id="inputName" placeholder="Name" required>
    </div>
  </div>
  <div class="form_row">
    <div class="form-group row col-md-6">
      <input type="email" class="form-control" id="inputEmail" placeholder="Email" required>
        <div id="email_error" class="collapse" style="color:red">The email is already used</div>
    </div>
    <div class="form-group row col-md-6">
      <input type="tel" class="form-control" id="inputPhone" placeholder="Phone" required>
    </div>
  </div>
  <div class="form-group row col-md-6">
      <label for="message">Message</label>
      <textarea type="text" class="form-control" id="inputMessage" placeholder="Short message to explain your motivation"></textarea>
    </div>
  </div>
  <div>
   <label for="file">Sélectionner les fichiers à envoyer</label>
   <input type="file" id="file" name="file" multiple>
 </div>
  <button type="submit" class="btn btn-outline-primary">Sign up</button>
</form>



let form = document.createElement('form');
            form.id="applyForm";

            let div1 = document.createElement('div');
            div1.className = "form_row";
            form.appendChild(div1);

            let div2 = document.createElement('div');
            div2.className="form-group center row col-md-6";
            form.appendChild(div2);

            let inputFirstname = document.createElement('input');
            inputFirstname.type = "text";
            inputFirstname.className="form-control";
            inputFirstname.id ="inputFirstName";
            inputFirstname.placeholder="FirstName";
            inputFirstname.required = "true";
            div2.appendChild(inputFirstname);

            let div3 = document.createElement('div');
            div3.className="form-group row col-md-6";
            form.appendChild(div3);

            let inputName = document.createElement('input');
            inputName.type = "text";
            inputName.className="form-control";
            inputName.id ="inputName";
            inputName.placeholder="Name";
            inputName.required = "true";
            div3.appendChild(inputName);

            let div4 = document.createElement('div');
            div4.className = "form_row";
            form.appendChild(div4);

            let div5 = document.createElement('div');
            div5.className="form-group row col-md-6";
            form.appendChild(div5);

            let inputEmail = document.createElement('input');
            inputEmail.type = "Email";
            inputEmail.className="form-control";
            inputEmail.id ="inputEmail";
            inputEmail.placeholder="Email";
            inputEmail.required = "true";
            div5.appendChild(inputEmail);

            let divEmail = document.createElement('div');
            divEmail.id="email_error";
            divEmail.className="collapse";
            divEmail.style.color="red";
            divEmail.textContent="The email is already used";
            div5.appendChild(divEmail);

            let div6 = document.createElement('div');
            div6.className="form-group row col-md-6";
            form.appendChild(div6);

            let inputTel = document.createElement('input');
            inputTel.type = "Tel";
            inputTel.className="form-control";
            inputTel.id ="inputPhone";
            inputTel.placeholder="Phone";
            inputTel.required = "true";
            div5.appendChild(inputTel);

            let div7 = document.createElement('div');
            div7.className="form-group row col-md-6";
            form.appendChild(div7);

            let textarea = document.createElement('textarea');
            textarea.type="text";
            textarea.className="form-control";
            textarea.id="inputMessage";
            textarea.placeholder="Short message to explain your motivation";
            div7.appendChild(textarea);

            let div8 = document.createElement('div');
            form.appendChild(div8);

            let inputFile = document.createElement('input');
            inputFile.type="file";
            inputFile.id="file";
            inputFile.name="file";
            inputFile.multiple = "true";
            div8.appendChild(inputFile);

            let btnSubmit = document.createElement('button');
            btnSubmit.type = submit;
            btnSubmit.className="btn btn-outline-primary";
            btnSubmit.formTarget="collapse";
            btnSubmit.textContent="apply !";

            let div9 = document.createElement('div');
            div9.className="row";
            form.appendChild(div9);

            let div10 = document.createElement('div');
            div10.className="col";
            div9.appendChild(div10);

            let div11 = document.createElement('div');
            div11.className="collapse multi-collapse";
            div11.id="collapse";
            div10.appendChild(div11);

            let div12 = document.createElement('div');
            div12.className="card card-body";
            div12.textContent="Félicitation vous venez de postuler pour l'annonce : id"
            div11.appendChild(div12);

            document.body.appendChild(form);
            console.log('form');