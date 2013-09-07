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

public class GalleryActivity extends MenuActivity {
	private Button videosButton;
	private Button photosButton;
	private Button audioRecordingsButton;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_gallery);

		videosButton = (Button) this.findViewById(R.id.videosButton);
		videosButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent intent = new Intent(GalleryActivity.this,
						VideoListActivity.class);
				//use putExtra method of Intent here for passing additional information to VideoListActivity
				startActivity(intent);
			}
		});
		photosButton = (Button) this.findViewById(R.id.photosButton);
		photosButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent intent = new Intent(GalleryActivity.this,
						PhotoGridActivity.class);
				//use putExtra method of Intent here for passing additional information to PhotoGridActivity
				startActivity(intent);
			}
		});
		audioRecordingsButton = (Button) this
				.findViewById(R.id.audioRecordingsButton);
		audioRecordingsButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent intent = new Intent(GalleryActivity.this,
						AudioListActivity.class);
				//use putExtra method of Intent here for passing additional information to AudioListActivity
				startActivity(intent);
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
