window.addEventListenerToConceptPin = function (pinElement, inputField, maxCharacters, countText) {
  const p = countText
  pinElement.addEventListener(
    "click",
    function () {
      p.innerHTML = inputField.value.length + "/" + maxCharacters
      p.classList.remove("text-red-400")
      p.textContent = "0" + "/" + maxCharacters
    }
  )
};

window.addEventListenerToInputField = function (inputField, countText, maxCharacters) {
  const p = countText
  inputField.addEventListener(
    "input",
    function () {
      p.textContent = inputField.value.length + "/" + maxCharacters
      if (inputField.value.length >= maxCharacters - 2) {
        p.classList.add("text-red-400");
      } else if (inputField.value.length <= maxCharacters - 2) {
        p.classList.remove("text-red-400");
      }
    }
  );
};

setMaxCharacters = (inputField, maxCharacters) => {
  inputField.maxLength = maxCharacters
}

setInnerHTMLOfCountText = (inputField, maxCharacters, countText) => {
  const p = countText
  p.innerHTML = inputField.value.length + "/" + maxCharacters
};

colorPinOnTyping = (pinElement, inputField) => {
  inputField.addEventListener(
    "keyup",
    function () {
      if (inputField.value.length > 0) {
        addColorToPin(pinElement)
      } else if (inputField.value.length == 0) {
        removeColorFromPin(pinElement)
      }
    }
  )
};

addColorToPin = (pinElement) => {
  pinElement.classList.add("bg-post-it-yellowy", "hover:bg-post-it-yellowy-dark", "active:bg-post-it-yellowy-darker");
  pinElement.classList.remove("bg-lighter-gray");
  pinElement.firstElementChild.style.fill = "#312783";
}

window.removeColorFromPin = function (pinElement) {
  pinElement.classList.remove("bg-post-it-yellowy", "hover:bg-post-it-yellowy-dark", "active:bg-post-it-yellowy-darker");
  pinElement.classList.add("bg-lighter-gray");
  pinElement.firstElementChild.style.fill = "white";
}

const maxCharacters = 110
const conceptInput = document.getElementById("concept_text");
const characterCountConcept = document.getElementById("characterCountConcept");
const conceptPinElement = document.getElementById("addConceptPin");

addEventListenerToConceptPin(conceptPinElement, conceptInput, maxCharacters, characterCountConcept);

addEventListenerToInputField(conceptInput, characterCountConcept, maxCharacters);

setInnerHTMLOfCountText(conceptInput, maxCharacters, characterCountConcept);

colorPinOnTyping(conceptPinElement, conceptInput);

setMaxCharacters(conceptInput, maxCharacters)
