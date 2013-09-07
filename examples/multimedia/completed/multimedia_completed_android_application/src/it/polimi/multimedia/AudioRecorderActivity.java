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

public class AudioRecorderActivity extends MenuActivity {
	private Button playButton;
	private Button pauseButton;
	private Button stopButton;
	private MediaPlayer audioPlayer;
	private Button recordButton;
	private MediaRecorder audioRecorder;
	private String recordedAudioPath;
	private boolean isRecording = false;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_audiorecorder);

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
		recordButton = (Button) this
				.findViewById(R.id.audioRecorderRecordButton);
		recordButton.setText("Rec");
		recordButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				if (!isRecording) { //start recording
					String audiosPath = getFilesDir().getAbsolutePath()
							+ "/audios";
					File audiosDirectory = new File(audiosPath);
					audiosDirectory.mkdir();
					String filename = new SimpleDateFormat(
							"yyyy-MM-dd_HH-mm-ss").format(new Date()) + ".mp3";
					String localAudioPath = audiosPath + "/" + filename;
					recordedAudioPath = localAudioPath;

					audioRecorder = new MediaRecorder();
					audioRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
					audioRecorder
							.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
					audioRecorder.setOutputFile(recordedAudioPath);
					audioRecorder
							.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
					try {
						audioRecorder.prepare();
						audioRecorder.start();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					recordButton.setText("Stop");
				} else { //stop recording
					audioRecorder.stop();
					audioRecorder.release();
					audioRecorder = null;
					try {
						audioPlayer = new MediaPlayer();
						audioPlayer.setDataSource(new FileInputStream(
								recordedAudioPath).getFD());
						audioPlayer.prepare();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					recordButton.setText("Rec");
				}
				isRecording = !isRecording;
			}
		});
		this.playButton = (Button) this
				.findViewById(R.id.audioPlayerPlayButton);
		this.playButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				if (audioRecorder != null && isRecording) {
					audioRecorder.stop();
					audioRecorder.release();
					audioRecorder = null;
					try {
						audioPlayer = new MediaPlayer();
						audioPlayer.setDataSource(new FileInputStream(
								recordedAudioPath).getFD());
						audioPlayer.prepare();
						audioPlayer.start();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					recordButton.setText("Rec");
					isRecording = false;
				} else if (audioPlayer != null) {
					audioPlayer.start();
				}
			}
		});

		this.pauseButton = (Button) this
				.findViewById(R.id.audioPlayerPauseButton);
		this.pauseButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				if (audioPlayer != null) {
					audioPlayer.pause();
				}
			}
		});

		this.stopButton = (Button) this
				.findViewById(R.id.audioPlayerStopButton);
		this.stopButton.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				if (audioPlayer != null) {
					audioPlayer.pause();
					audioPlayer.seekTo(0);
				}
			}
		});
	}

	@Override
	protected void onPause() {
		//TODO Auto-generated method stub
		super.onPause();
		if (audioRecorder != null) {
			audioRecorder.release();
			audioRecorder = null;
		}
		if (audioPlayer != null) {
			audioPlayer.release();
			audioPlayer = null;
		}
	}

	@Override
	protected void onStop() {
		//TODO Auto-generated method stub
		super.onStop();
	}
}
