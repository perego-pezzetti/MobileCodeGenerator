package it.polimi.valtellina;

import java.io.*;

import android.os.*;
import android.app.*;
import android.content.*;
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

public class VideoActivity extends MenuActivity {
	private VideoView videoView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_video);

		videoView = (VideoView) this.findViewById(R.id.videoView);
		Uri videoViewVideoFileUri = Uri.parse("android.resource://"
				+ getPackageName() + "/" + R.raw.valtellina_video);
		videoView.setVideoURI(videoViewVideoFileUri);
		videoView.setMediaController(new MediaController(this));
		videoView.requestFocus();
		videoView.start();

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
