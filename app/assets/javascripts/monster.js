function addMonsterTagField() {
 
    //create Date object
    var date = new Date();
 
    //get number of milliseconds since midnight Jan 1, 1970 
    //and use it for address key
    var mSec = date.getTime(); 
 
    //Replace 0 with milliseconds
    idAttributTag =  
          "monster_monster_tags_attributes_0_kind".replace("0", mSec);
    nameAttributTag =  
          "monster[monster_tags_attributes][0][kind]".replace("0", mSec);
        
    //create <li> tag
    var li = document.createElement("li");
 
    //create label for Tag, set it's for attribute, 
    //and append it to <li> element
    var labelTag = document.createElement("label");
    labelTag.setAttribute("for", idAttributTag);
    var tagLabelText = document.createTextNode("Tag");
    labelTag.appendChild(tagLabelText);
    li.appendChild(labelTag);
 
    //create input for Kind, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputTag = document.createElement("INPUT");
    inputTag.setAttribute("type", "text");
    inputTag.setAttribute("id", idAttributTag);
    inputTag.setAttribute("name", nameAttributTag);
    li.appendChild(inputTag);
 
    //add created <li> element with its child elements 
    //(label and input) to myList (<ul>) element
    document.getElementById("myList").appendChild(li);
 
    //show monster_tag header
    $("#tagHeader").show(); 
}