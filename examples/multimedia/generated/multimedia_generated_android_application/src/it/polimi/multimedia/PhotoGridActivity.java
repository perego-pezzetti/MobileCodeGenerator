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

public class PhotoGridActivity extends MenuActivity
		implements
			OnItemClickListener {
	private GridView photosGridView;
	private ArrayAdapter<String> photosGridViewAdapter;
	private String[] photosGridViewContents;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_photogrid);

		photosGridViewContents = new String[]{};
		photosGridViewAdapter = new ArrayAdapter<String>(this,
				android.R.layout.simple_list_item_1, photosGridViewContents);
		photosGridView = (GridView) findViewById(R.id.photosGridView);
		photosGridView.setAdapter(photosGridViewAdapter);
		photosGridView.setOnItemClickListener(this);

	}

	@Override
	public void onItemClick(AdapterView<?> l, View v, int position, long id) {
		if (l.getId() == R.id.photosGridView) {
			String clickedItem = photosGridViewContents[position];
			Intent intent = new Intent(PhotoGridActivity.this,
					PhotoViewerActivity.class);
			//use putExtra method of Intent here for passing additional information to PhotoViewerActivity
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
