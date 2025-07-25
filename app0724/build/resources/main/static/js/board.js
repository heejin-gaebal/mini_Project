function insert() {
  const url = 'http://127.0.0.1:8080/api/board';
  const title = document.querySelector('input[name=insertTitle]').value;
  const content = document.querySelector('textarea[name=insertContent]').value;
  const categoryNo = document.querySelector('#insertCategorySelect').value;
  const vo = {
    title,
    content,
    categoryNo,
  };
  const option = {
    method: 'post',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(vo),
  };
  fetch(url, option)
    .then((resp) => resp.json())
    .then((result) => {
      if (result == 1) {
        Swal.fire({
          title: 'Insert Success!',
          icon: 'success',
          draggable: true,
        });
        list();
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Please try again!',
        });
      }
    });
}

function list(num = 1) {
  const url = `http://127.0.0.1:8080/api/board/page/${num}`;
  fetch(url)
    .then((resp) => resp.json())
    .then((map) => {
      const voList = map.voList;
      const boardCount = map.boardCount;
      const pvo = map.pvo;

      const listBody = document.querySelector('.listTable table tbody');
      document.querySelector('.boardCount .cnt').textContent = boardCount;

      let str = '';
      for (const vo of voList) {
        str += `
          <tr>
            <td>${vo.no}</td>
            <td>${vo.title}</td>
            <td>${vo.content}</td>
            <td>${vo.categoryName}</td>
            <td>${vo.createdAt}</td>
            <td>${vo.modifiedAt}</td>
          </tr>
        `;
      }
      listBody.innerHTML = str;

      //paging
      const pageBody = document.querySelector('.pagination');
      let pageStr = '';
      if (pvo.startPage != 1) {
        pageStr += `
          <li class="page-item">
            <a class="page-link" href="javascript:;" 
              onclick="list(${pvo.startPage - 1});" aria-label="Previous"">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
        `;
      }
      for (let i = pvo.startPage; i <= pvo.endPage; i++) {
        pageStr += `<li class="page-item"><a class="page-link" href="javascript:;" onclick="list(${i});">${i}</a></li>`;
      }
      if (pvo.endPage !== pvo.maxPage) {
        pageStr += `
          <li class="page-item">
            <a class="page-link" href="javascript:;" 
              onclick="list(${pvo.endPage + 1})" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        `;
      }
      pageBody.innerHTML = pageStr;
    });
}
list();

function search() {
  const no = document.querySelector('input[name=search]').value;
  const url = `http://127.0.0.1:8080/api/board/${no}`;
  fetch(url)
    .then((resp) => resp.json())
    .then((vo) => {
      const insertBody = document.querySelector('.insertTable tbody');
      let str = '';
      str += `
        <tr>
          <td>${vo.no}</td>
          <td>${vo.title}</td>
          <td>${vo.content}</td>
          <td>${vo.categoryName}</td>
          <td>${vo.createdAt}</td>
          <td>${vo.modifiedAt}</td>
        </tr>
      `;
      insertBody.innerHTML = str;
    });
}

function selectCategory() {
  const url = 'http://127.0.0.1:8080/api/board/category';
  fetch(url)
    .then((resp) => resp.json())
    .then((catgryVoList) => {
      const selectTags = document.querySelectorAll(
        'select[name=categorySelect]'
      );
      let str = '';

      for (const vo of catgryVoList) {
        str += `
          <option value="${vo.categoryNo}">${vo.categoryName}</option>
        `;
      }
      selectTags.forEach((selectTag) => {
        selectTag.innerHTML = str;
      });
    });
}
selectCategory();

function update() {
  const no = document.querySelector('input[name=search]').value;
  const title = document.querySelector('input[name=updateTitle]').value;
  const content = document.querySelector('textarea[name=updateContent]').value;
  const categoryNo = document.querySelector('#updateCategorySelect').value;
  const vo = {
    no,
    title,
    content,
    categoryNo,
  };
  const url = 'http://127.0.0.1:8080/api/board';
  const option = {
    method: 'put',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(vo),
  };
  fetch(url, option)
    .then((resp) => resp.json())
    .then((result) => {
      if (result == 1) {
        Swal.fire({
          title: 'Update Success!',
          icon: 'success',
          draggable: true,
        });
        list();
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Please try again!',
        });
      }
    });
}

function deleteBoard() {
  const no = document.querySelector('input[name=search]').value;
  const vo = {
    no,
  };
  const url = 'http://127.0.0.1:8080/api/board';
  const option = {
    method: 'delete',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(vo),
  };
  fetch(url, option)
    .then((resp) => resp.json())
    .then((result) => {
      if (result == 1) {
        Swal.fire({
          title: 'Delete Success!',
          icon: 'success',
          draggable: true,
        });
        list();
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Please try again!',
        });
      }
    });
}
