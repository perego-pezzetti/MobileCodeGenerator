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

public class VideoViewerActivity extends MenuActivity {
	private Button deleteVideoButton;
	private VideoView videoViewerVideoView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_videoviewer);

		deleteVideoButton = (Button) this.findViewById(R.id.deleteVideoButton);
		deleteVideoButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				//TODO implement the action
			}
		});

		videoViewerVideoView = (VideoView) this
				.findViewById(R.id.videoViewerVideoView);
		Uri videoViewerVideoViewVideoFileUri = Uri.parse("android.resource://"
				+ getPackageName() + "/" /*+R.raw.filename...*/); //TODO insert local file name
		videoViewerVideoView.setVideoURI(videoViewerVideoViewVideoFileUri);
		videoViewerVideoView.setMediaController(new MediaController(this));
		videoViewerVideoView.requestFocus();
		videoViewerVideoView.start();

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
	}

	@Override
	protected void onPause() {
		//TODO Auto-generated method stub
		super.onPause();
	}

	@Override
	protected void onStop() {
		//TODO Auto-generated method stub
		super.onStop();
	}
}
