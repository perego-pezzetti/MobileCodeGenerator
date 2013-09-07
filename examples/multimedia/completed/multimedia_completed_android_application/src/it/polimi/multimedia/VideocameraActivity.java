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

public class VideocameraActivity extends MenuActivity {
	private VideoView videoView;
	private Button videocameraButton;
	private static final int VIDEO_CAPTURE_ACTIVITY_REQUEST_CODE = 200;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_videocamera);

		videocameraButton = (Button) this.findViewById(R.id.videocameraButton);
		videocameraButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent takeVideoIntent = new Intent(
						MediaStore.ACTION_VIDEO_CAPTURE);
				startActivityForResult(takeVideoIntent,
						VIDEO_CAPTURE_ACTIVITY_REQUEST_CODE);
			}
		});

		videoView = (VideoView) this.findViewById(R.id.videoView);

	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (resultCode == Activity.RESULT_OK) {
			if (requestCode == VIDEO_CAPTURE_ACTIVITY_REQUEST_CODE) {
				Uri videoFileUri = data.getData();
				String localVideoFileUri = this
						.copyVideoInVideosFolder(videoFileUri);
				//TODO use the video
				videoView.setVideoURI(videoFileUri);
				videoView.setMediaController(new MediaController(this));
				videoView.requestFocus();
				videoView.start();
			}
		} else if (resultCode == Activity.RESULT_CANCELED) {
			//User cancelled the media capture
			//TODO implement the action
		}
	}
	private String copyVideoInVideosFolder(Uri sourceVideoFileUri) {
		String localVideoPath = null;
		try {
			AssetFileDescriptor videoAsset = getContentResolver()
					.openAssetFileDescriptor(sourceVideoFileUri, "r");
			FileInputStream fis = videoAsset.createInputStream();
			String videosPath = getFilesDir().getAbsolutePath() + "/videos";
			File videosDirectory = new File(videosPath);
			videosDirectory.mkdir();
			String filename = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss")
					.format(new Date()) + ".3gp";
			localVideoPath = videosPath + "/" + filename;
			File localVideoFile = new File(localVideoPath);
			FileOutputStream fos = new FileOutputStream(localVideoFile);
			byte[] buf = new byte[10240];
			int len;
			while ((len = fis.read(buf)) > 0) {
				fos.write(buf, 0, len);
			}
			fis.close();
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return localVideoPath;
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
