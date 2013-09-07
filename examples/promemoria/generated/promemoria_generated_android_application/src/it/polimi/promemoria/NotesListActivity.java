package it.polimi.promemoria;

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

public class NotesListActivity extends Activity implements OnItemClickListener {
	private Button addButton;
	private ListView notesListView;
	private ArrayAdapter<String> notesListViewAdapter;
	private String[] notesListViewContents;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_noteslist);

		addButton = (Button) this.findViewById(R.id.addButton);
		addButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent intent = new Intent(NotesListActivity.this,
						NoteDetailActivity.class);
				//use putExtra method of Intent here for passing additional information to NoteDetailActivity
				startActivity(intent);
			}
		});

		notesListViewContents = new String[]{};
		notesListViewAdapter = new ArrayAdapter<String>(this,
				android.R.layout.simple_list_item_1, notesListViewContents);
		notesListView = (ListView) findViewById(R.id.notesListView);
		notesListView.setAdapter(notesListViewAdapter);
		notesListView.setOnItemClickListener(this);

	}

	@Override
	public void onItemClick(AdapterView<?> l, View v, int position, long id) {
		if (l.getId() == R.id.notesListView) {
			String clickedItem = notesListViewContents[position];
			Intent intent = new Intent(NotesListActivity.this,
					NoteDetailActivity.class);
			//use putExtra method of Intent here for passing additional information to NoteDetailActivity
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
