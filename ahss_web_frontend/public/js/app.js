
const gasswitch=document.getElementById('gasswitch')
const fireswitch=document.querySelector('.fireswitch')
const smokeswitch=document.querySelector('.smokeswitch')
const abdu='this is me'
const motionswitch=document.querySelector('.motionswitch')
console.log(abdu)
gasswitch.addEventListener('click',()=>{
    fireswitch.classList.add('onoff')
})

