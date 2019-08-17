
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {

  let dogLinks = [];
  const dogsNameArr = Object.keys(dogs);
  const dogsLinkArr = Object.values(dogs);

  for(let i = 0; i < dogsNameArr.length; i++) {

    let dogTag = document.createElement('a');
    dogTag.innerHTML = dogsNameArr[i];
    dogTag.href = dogsLinkArr[i];
    let dogListItem = document.createElement('li');
    dogListItem.className = 'dog-link';
    dogListItem.appendChild(dogTag);
    dogLinks.push(dogListItem);
  }
  return dogLinks;
}

function attachDogLinks () {
  const dogLinks = dogLinkCreator();
  let dropdownDogList = document.getElementsByClassName("drop-down-dog-list")[0];
  for (let i = 0; i < dogLinks.length ; i++) {
    dropdownDogList.appendChild(dogLinks[i]);
  }
}

function handleEnter() {
  const dropDownHeader = document.getElementsByClassName("drop-down-dog-nav")[0].children[0];
  const dropDown = document.getElementsByClassName("drop-down-dog-nav")[0].children[1];

  dropDownHeader.addEventListener("mouseover", function() {
    // debugger
    let linkArr = Array.from(dropDown.children);
    for (let i = 0; i < linkArr.length; i++) {
      linkArr[i].className = "dog-link-show";
    }
  })
}

function handleLeave() {
  const dropDownHeader = document.getElementsByClassName("drop-down-dog-nav")[0].children[0];
  const dropDown = document.getElementsByClassName("drop-down-dog-nav")[0].children[1];

  dropDown.addEventListener("mouseleave", function() {
    // debugger
    let linkArr = Array.from(dropDown.children);
    for (let i = 0; i < linkArr.length; i++) {
      linkArr[i].className = "dog-link";
    }
  })
}

attachDogLinks();
handleEnter();
handleLeave();
