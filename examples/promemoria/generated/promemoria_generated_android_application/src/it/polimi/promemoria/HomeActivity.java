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

public class HomeActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_home);

		ProgressDialog homeProgressDialog = new ProgressDialog(
				HomeActivity.this);
		homeProgressDialog.setTitle("Promemoria");
		homeProgressDialog.setMessage("Aggiornamento in corso…");
		homeProgressDialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
		homeProgressDialog.show();
		//TODO do something before dismissing it.
		homeProgressDialog.dismiss();

		new notesDownloaderAsyncTask().execute();
	}

	private class notesDownloaderAsyncTask
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
