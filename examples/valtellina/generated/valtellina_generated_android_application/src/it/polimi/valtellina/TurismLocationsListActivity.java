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

public class TurismLocationsListActivity extends MenuActivity
		implements
			OnItemClickListener {
	private ListView turismLocationListView;
	private ArrayAdapter<String> turismLocationListViewAdapter;
	private String[] turismLocationListViewContents;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_turismlocationslist);

		turismLocationListViewContents = new String[]{"Aprica", "Bormio",
				"Chiesa Valmalenco", "Livigno", "Madesimo",
				"Santa Caterina Valfurva", "Teglio", "Tirano", "Val Masino",
				"Piantedo", "Dazio",};
		turismLocationListViewAdapter = new ArrayAdapter<String>(this,
				android.R.layout.simple_list_item_1,
				turismLocationListViewContents);
		turismLocationListView = (ListView) findViewById(R.id.turismLocationListView);
		turismLocationListView.setAdapter(turismLocationListViewAdapter);
		turismLocationListView.setOnItemClickListener(this);

	}

	@Override
	public void onItemClick(AdapterView<?> l, View v, int position, long id) {
		if (l.getId() == R.id.turismLocationListView) {
			String clickedItem = turismLocationListViewContents[position];
			Intent intent = new Intent(TurismLocationsListActivity.this,
					TurismLocationDetailActivity.class);
			//use putExtra method of Intent here for passing additional information to TurismLocationDetailActivity
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
