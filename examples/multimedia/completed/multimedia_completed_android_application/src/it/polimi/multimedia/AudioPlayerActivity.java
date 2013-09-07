package it.polimi.multimedia;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import android.os.*;
import android.app.*;
import android.content.*;
import android.content.res.*;
import android.graphics.Bitmap;
import android.view.*;
import android.view.View.*;
import android.widget.*;
import android.widget.AdapterView.*;
import android.webkit.*;
import android.location.*;
import android.net.Uri;
import android.provider.MediaStore;
import android.media.*;

public class AudioPlayerActivity extends MenuActivity {
	private Button deleteAudioButton;
	private Button playButton;
	private Button pauseButton;
	private Button stopButton;
	private MediaPlayer recordingAudioPlayer;
	private String filename;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_audioplayer);

		deleteAudioButton = (Button) this.findViewById(R.id.deleteAudioButton);
		deleteAudioButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				File fileToDelete = new File(getFilesDir().getAbsoluteFile() + "/audios/" + filename);
				fileToDelete.delete();
				finish();
			}
		});

	}

	@Override
	protected void onStart() {
		//TODO Auto-generated method stub
		super.onStart();
	}

	@Override
	protected void onResume() {
		//TODO Auto-generated method stub
		super.onResume();
		try {
			recordingAudioPlayer = new MediaPlayer();
			recordingAudioPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);
			
			filename = getIntent().getExtras().getString("filename");
			recordingAudioPlayer.setDataSource(getFilesDir().getAbsolutePath() + "/audios/" + filename);
			recordingAudioPlayer.prepare();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		this.playButton = (Button) this
				.findViewById(R.id.recordingAudioPlayerPlayButton);
		this.playButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				recordingAudioPlayer.start();
			}
		});

		this.pauseButton = (Button) this
				.findViewById(R.id.recordingAudioPlayerPauseButton);
		this.pauseButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				recordingAudioPlayer.pause();
			}
		});

		this.stopButton = (Button) this
				.findViewById(R.id.recordingAudioPlayerStopButton);
		this.stopButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				recordingAudioPlayer.pause();
				recordingAudioPlayer.seekTo(0);
			}
		});
	}

	@Override
	protected void onPause() {
		//TODO Auto-generated method stub
		super.onPause();
		if (recordingAudioPlayer != null) {
			recordingAudioPlayer.release();
			recordingAudioPlayer = null;
		}
	}

	@Override
	protected void onStop() {
		//TODO Auto-generated method stub
		super.onStop();
	}
}
