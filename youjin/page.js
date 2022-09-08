function openCloseTocA() {
    if(document.getElementById('toc-contentA').style.display === 'block') {
      document.getElementById('toc-contentA').style.display = 'none';
      document.getElementById('toc-toggleA').textContent = '∨';
    } else {
      document.getElementById('toc-contentA').style.display = 'block';
      document.getElementById('toc-toggleA').textContent = '∧';
    }
  }

  function openCloseTocB() {
    if(document.getElementById('toc-contentB').style.display === 'block') {
      document.getElementById('toc-contentB').style.display = 'none';
      document.getElementById('toc-toggleB').textContent = '∨';
    } else {
      document.getElementById('toc-contentB').style.display = 'block';
      document.getElementById('toc-toggleB').textContent = '∧';
    }
  }

  function openCloseTocC() {
    if(document.getElementById('toc-contentC').style.display === 'block') {
      document.getElementById('toc-contentC').style.display = 'none';
      document.getElementById('toc-toggleC').textContent = '∨';
    } else {
      document.getElementById('toc-contentC').style.display = 'block';
      document.getElementById('toc-toggleC').textContent = '∧';
    }
  }