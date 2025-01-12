import { addClassName } from "astro-expressive-code/hast";
import { useState, useEffect} from "react";
import '../styles/global.css'
import { createElement } from "react";

// const API_ENDPOINT = "http://localhost:8000"
const API_ENDPOINT = "https://api.mahoosively.gay"
let initialLoad = true;

const MainDiv = () => {
    const [nowPlayingData, setNowPlayingData] = useState(null);
    const [nowPlayingIsLoading, setNowPlayingIsLoading] = useState(true);
    const [errorNowPlaying, setErrorNowPlaying] = useState(null);

    const [topTracksData, setTopTracksData] = useState(null);
    const [topTracksIsLoading, setTopTracksIsLoading] = useState(true);
    const [errorTopTracks, setErrorTopTracks] = useState(null);

    const fetchDataNowPlaying = async () => {
        setNowPlayingIsLoading(true); // Set loading to true when fetching starts
        try {
            const response = await fetch(API_ENDPOINT + '/getNowPlaying');
            if (!response.ok) {
                throw new Error('Network response was not ok.');
            }
            const data = await response.json();
            setNowPlayingData(data); // Set the fetched data
            setNowPlayingIsLoading(false); // Set loading to false when done
        }  catch (errorNowPlaying) {
            setErrorNowPlaying(errorNowPlaying.message);
            setNowPlayingIsLoading(false); // Handle errors
        }
    };
    const fetchDataTopTracks = async () => {
        setTopTracksIsLoading(true); // Set loading to true when fetching starts
        try {
            const response = await fetch(API_ENDPOINT + '/getTopTracks');
            if (!response.ok) {
                throw new Error('Network response was not ok.');
            }
            const data = await response.json();
            setTopTracksData(data); // Set the fetched data
            setTopTracksIsLoading(false); // Set loading to false when done
        }  catch (errorTopTracks) {
            setTopTracksData(errorTopTracks.message);
            setTopTracksIsLoading(false); // Handle errors
        }
    };
    // Fetch data initially when component mounts
    useEffect(() => {
        fetchDataNowPlaying();
        fetchDataTopTracks();
    }, []);


    // Button click triggers re-fetch
    const handleRefresh = () => {
        fetchDataNowPlaying();
    };

        // While loading, show a loading spinner or message
        if (nowPlayingIsLoading && initialLoad) {
            return (
                <div>
                    <div className="urgh1" style={{minHeight:'40px'}}></div>
                    <div className="urgh" style={{minHeight:'120px'}} aria-busy="true"></div>
                </div>
            )
            }
        else if(nowPlayingIsLoading && !initialLoad){
            return(
                <div>
                <div className="urgh1" style={{minHeight:'40px'}}></div>
                <div className="urgh" style={{minHeight:'120px'}} aria-busy="true"></div>
                <div className="topTracksHolder">
                <TopTracksComp data={topTracksData}/>
            </div>
            </div>
            );
        }

        // If no data is fetched, show error or retry message
        if (!topTracksData) {
            return (
                <p>Sadly, I am currently not listening to anything - but you can still see my top songs below:</p>
            )
            
        }

        initialLoad = false;
        

    return (
        <div className="HoldingBothDiv">
            <div className="nowPlayingOrLoading" style={{minHeight:'160px'}}>
                <PlayingNowComp songInfo={nowPlayingData}/>
                <div style={{paddingTop: "1vh", paddingBottom:"1vh"}}>
                <button className="container secondary"  onClick= {handleRefresh}> Refresh Now Playing</button>
                </div>

            </div>
            <div className="topTracksHolder">
                <TopTracksComp data={topTracksData}/>
            </div>
        </div>
    );
}

function RenderTopTrack({songName, artistName, urlToSong}) {
        return (
            <a className="linkToTopTrack" target="_blank" href={urlToSong}>
                <article className="cardSongs">
                    <h4>{songName}</h4>
                    <p>{artistName}</p>
                </article>
            </a>
        );
    };

function TopTracksComp({data}) {
    
    const songList = data.map((song) => {
        return(    
            <div key={song.songRankNumber}>         
                <RenderTopTrack songName={song.songName} artistName={song.artist} urlToSong = {song.urlToSong}/>
            </div>
        );

    }
    );
    return(
        <div>
            <div className="getTopTracks">
                {songList}
            </div>
            <footer className="container" style={{paddingTop:"3.5vh"}}>
                <p>[~/spotifySongs]::$ <a className="linkHome" href="/"> cd ~/</a></p>
            </footer>
        </div>
    );
    

}

function PlayingNowComp({ songInfo}) {
    if(!songInfo) {
        return(
            <p>Sadly, I am currently not listening to anything - but you can still see my top songs below:</p>
        )
    }
    else if( songInfo.isPlaying === "false") {
        return(
            <p>Sadly, I am currently not listening to anything - but you can still see my top songs below:</p>
        )
    }
    
    const songNowPlaying = songInfo.songName;
    const artistNowPlaying = songInfo.artist;
    const songURL = songInfo.urlToSong;
    const songDuration = songInfo.totalDuration;
    const currentProgress = songInfo.progress;
    const animationCss = `fill ${songDuration}s linear forwards`;
    const animationDelayCSS = `-${currentProgress}s`;


    console.log(animationCss, animationDelayCSS);
    return(
    <div>
        <div className="playingNow">
            <p>I am currently listening to <a className= "linkToNowPlaying" target= "_blank" href={songURL}><b className="boldedSongNameNowPlaying">{songNowPlaying}</b></a>, performed by <b className="boldedArtistNameNowPlaying">{artistNowPlaying}</b> </p>
        </div>
        {/* <div className="spotifyBar" style={{animation: 'fill 248s linear forwards', animationDelay: '-19s'}}> </div> */}
        <div className="spotifyBar" style={{animation: `${animationCss}`, animationDelay: `${animationDelayCSS}`}}> </div>
    </div>
    );
}

  export default function SpotifySongsReact() {
    return < MainDiv/>;
  }
  