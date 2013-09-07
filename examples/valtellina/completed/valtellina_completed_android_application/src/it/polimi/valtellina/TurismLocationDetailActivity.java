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

public class TurismLocationDetailActivity extends MenuActivity {
	private ImageView imageView; 
	private TextView descriptionTextView;
	private TextView titleTextView;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_turismlocationdetail);
		Bundle bundle = getIntent().getExtras();
		Integer selectedItemText = (Integer) bundle.getSerializable("selectedItemText");
		Integer selectedItemImage = (Integer) bundle.getSerializable("selectedItemImage");
		String selectedItemTitle = (String) bundle.getSerializable("selectedItemTitle");
		imageView = (ImageView)findViewById(R.id.imageView);
		imageView.setImageResource(selectedItemImage);
		titleTextView = (TextView) findViewById(R.id.titleTextView);
		titleTextView.setText(selectedItemTitle);
		descriptionTextView = (TextView) findViewById(R.id.descriptionTextView);
		InputStream is = this.getResources().openRawResource(selectedItemText);
		String text = Utils.fromInputStreamToString(is);
		descriptionTextView.setText(text);
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
