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

public class VideoListActivity extends MenuActivity
		implements
			OnItemClickListener {
	private ListView videosListView;
	private ArrayAdapter<String> videosListViewAdapter;
	private String[] videosListViewContents;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_videolist);

		videosListViewContents = new String[]{};
		videosListViewAdapter = new ArrayAdapter<String>(this,
				android.R.layout.simple_list_item_1, videosListViewContents);
		videosListView = (ListView) findViewById(R.id.videosListView);
		videosListView.setAdapter(videosListViewAdapter);
		videosListView.setOnItemClickListener(this);

	}

	@Override
	public void onItemClick(AdapterView<?> l, View v, int position, long id) {
		if (l.getId() == R.id.videosListView) {
			String clickedItem = videosListViewContents[position];
			Intent intent = new Intent(VideoListActivity.this,
					VideoViewerActivity.class);
			//use putExtra method of Intent here for passing additional information to VideoViewerActivity
			startActivity(intent);
		}
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
