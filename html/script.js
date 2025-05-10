window.addEventListener('message', (event) => {
    const data = event.data
    if (data.action === 'open') {
      document.body.style.display = 'flex'
      const container = document.getElementById('presets')
      container.innerHTML = ''
      Object.keys(data.presets).forEach(key => {
        const btn = document.createElement('button')
        btn.textContent = data.presets[key].name
        btn.onclick = () => {
          fetch(`https://${GetParentResourceName()}/applyPreset`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ preset: key })
          })
        }
        container.appendChild(btn)
      })
    }
  })
  
  document.getElementById('applyCustom').onclick = () => {
    fetch(`https://${GetParentResourceName()}/updateCustom`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        density: document.getElementById('density').value,
        lod: document.getElementById('lod').value,
        shadows: document.getElementById('shadows').checked,
        timecycle: document.getElementById('timecycle').value
      })
    })
  }
  
  document.getElementById('close').onclick = () => {
    fetch(`https://${GetParentResourceName()}/close`, {
      method: 'POST'
    })
    document.body.style.display = 'none'
  }
  