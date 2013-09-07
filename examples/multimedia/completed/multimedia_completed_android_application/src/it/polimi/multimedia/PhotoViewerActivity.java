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

public class PhotoViewerActivity extends MenuActivity {
	private Button deletePhotoButton;
	private ImageView imageViewerImageView;
	private String filename;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_photoviewer);

		deletePhotoButton = (Button) this.findViewById(R.id.deletePhotoButton);
		deletePhotoButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				File fileToDelete = new File(getFilesDir().getAbsoluteFile() + "/images/" + filename);
				fileToDelete.delete();
				finish();
			}
		});
		
		imageViewerImageView = (ImageView) this.findViewById(R.id.imageViewerImageView);
		filename = getIntent().getExtras().getString("filename");
		String path = getFilesDir().getAbsolutePath() + "/images/" + filename;
		imageViewerImageView.setImageURI(Uri.parse(path));
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
