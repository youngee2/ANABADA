
// Modal을 가져옵니다.
var modals = document.getElementsByClassName("modal");
// Modal을 띄우는 클래스 이름을 가져옵니다.
var btns = document.getElementsByClassName("btn");
// Modal을 닫는 close 클래스를 가져옵니다.
var spanes = document.getElementsByClassName("close");
var funcs = [];

// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
function Modal(num) {
  return function () {
    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
    btns[num].onclick = function () {
      modals[num].style.display = "block";
      console.log(num);
    };

    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
    spanes[num].onclick = function () {
      modals[num].style.display = "none";
    };
  };
}

// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
for (var i = 0; i < btns.length; i++) {
  funcs[i] = Modal(i);
}

// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
for (var j = 0; j < btns.length; j++) {
  funcs[j]();
}

// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
window.onclick = function (event) {
  if (event.target.className == "modal") {
    event.target.style.display = "none";
  }
};


//탈퇴 버튼 눌렀을 때 알림창
function SignOutbtn() {
  if (confirm("정말 탈퇴하시겠습니까?") == true) {    //확인

    alert("탈퇴 되었습니다.");

  } else {
    alert("취소 되었습니다.");
    return;

  }
}


/*WhoWeAre*/

gsap.set('.main', { background:'#fff', width:'100%', maxWidth:'1920px', height:'100%', top:0, left:'50%', x:'-50%'})
gsap.set('.scrollDist', {width:'100%', height:'250%'})
gsap.timeline({scrollTrigger:{trigger:'.scrollDist', start:'top top', end:'bottom bottom', scrub:1}})
.fromTo('.cloud', {y:0},{y:-700}, 0)

/*SellBoard*/
var submit = document.getElementById('submitButton');
submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

function showImage() {
    var newImage = document.getElementById('image-show').lastElementChild;
    newImage.style.visibility = "visible";
    
    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}


function loadFile(input) {
    var file = input.files[0];

    var name = document.getElementById('fileName');
    name.textContent = file.name;

    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
    newImage.style.objectFit = "contain";

    var container = document.getElementById('image-show');
    container.appendChild(newImage);
};

