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

public class NoteDetailActivity extends Activity {
	private Button saveButton;
	private Button deleteButton;
	private Button cancelButton;
	private EditText noteEditText;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_notedetail);

		saveButton = (Button) this.findViewById(R.id.saveButton);
		saveButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				//TODO implement the action
			}
		});
		deleteButton = (Button) this.findViewById(R.id.deleteButton);
		deleteButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				//TODO implement the action
			}
		});
		cancelButton = (Button) this.findViewById(R.id.cancelButton);
		cancelButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent intent = new Intent(NoteDetailActivity.this,
						NotesListActivity.class);
				//use putExtra method of Intent here for passing additional information to NotesListActivity
				startActivity(intent);
			}
		});

		noteEditText = (EditText) this.findViewById(R.id.noteEditText);
		noteEditText.setText("");

		ProgressDialog noteDetailProgressDialog = new ProgressDialog(
				NoteDetailActivity.this);
		noteDetailProgressDialog.setTitle("Promemoria");
		noteDetailProgressDialog.setMessage("Aggiornamento in corso…");
		noteDetailProgressDialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
		noteDetailProgressDialog.show();
		//TODO do something before dismissing it.
		noteDetailProgressDialog.dismiss();

		AlertDialog.Builder deleteAlertDialogBuilder = new AlertDialog.Builder(
				this);
		deleteAlertDialogBuilder.setTitle("Eliminazione Nota");
		deleteAlertDialogBuilder.setMessage("Vuoi eliminare la nota?");
		deleteAlertDialogBuilder.setPositiveButton("Ok",
				new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int which) {
						//TODO implement the positive action
					}
				});
		deleteAlertDialogBuilder.setNegativeButton("Cancel",
				new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int which) {
						//TODO implement the negative action
					}
				});
		AlertDialog deleteAlertDialog = deleteAlertDialogBuilder.create();
		deleteAlertDialog.show();

		new noteCancellerAsyncTask().execute();
		new noteSaverAsyncTask().execute();
	}

	private class noteCancellerAsyncTask
			extends
				AsyncTask<Void /*Params*/, Void /*Progress*/, Void /*Result*/> {
		@Override
		protected Void /*Result*/doInBackground(Void... params) {
			// TODO code to executed in the background task
			return null;
		}
		@Override
		protected void onPostExecute(Void result) {
			// TODO code to be executed on the main thread when background task is finished
			super.onPostExecute(result);
		}
	}
	private class noteSaverAsyncTask
			extends
				AsyncTask<Void /*Params*/, Void /*Progress*/, Void /*Result*/> {
		@Override
		protected Void /*Result*/doInBackground(Void... params) {
			// TODO code to executed in the background task
			return null;
		}
		@Override
		protected void onPostExecute(Void result) {
			// TODO code to be executed on the main thread when background task is finished
			super.onPostExecute(result);
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
