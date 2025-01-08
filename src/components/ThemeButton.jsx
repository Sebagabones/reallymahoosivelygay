import { useState } from 'preact/hooks';

function calculateSettingAsThemeString({localStorageTheme2, systemSettingDark2}) {
    if (localStorageTheme2 !== null) {
        return localStorageTheme2;
    };

    if (systemSettingDark2.matches) {
        return "dark";
    };

    return "light";
    };

export default function themeButton(){
    if (typeof window !== 'undefined') {
        console.log('we are running on the client')
    } else {
        console.log('we are running on the server');
    }
    
    const themeNow = calculateSettingAsThemeString(window.localStorage.getItem("theme"),window.matchMedia("(prefers-color-scheme: dark)"))
    // const themeNow = "Test";
    const themeNotNow = "Not test" ;
    console.log(themeNotNow ); 
    console.log(themeNow); 
    
    return(
        <li><button class="secondary"><a id="buttonForTheme" href="#"data-theme-switcher="dark"class="themeButton">{themeNotNow}</a></button></li>
        
    );
}