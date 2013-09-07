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

public class PhotocameraActivity extends MenuActivity {

	private ImageView imageView;
	private Button fotocameraButton;
	private static final int IMAGE_CAPTURE_ACTIVITY_REQUEST_CODE = 100;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_photocamera);

		fotocameraButton = (Button) this.findViewById(R.id.fotocameraButton);
		fotocameraButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent takePictureIntent = new Intent(
						MediaStore.ACTION_IMAGE_CAPTURE);
				startActivityForResult(takePictureIntent,
						IMAGE_CAPTURE_ACTIVITY_REQUEST_CODE);
			}
		});

		imageView = (ImageView) findViewById(R.id.imageView);

	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (resultCode == Activity.RESULT_OK) {
			if (requestCode == IMAGE_CAPTURE_ACTIVITY_REQUEST_CODE) {
				Bitmap photo = (Bitmap) data.getExtras().get("data");
				String localImageFileUri = this.copyImageInImagesFolder(photo);
				//TODO use the photo
				imageView.setImageBitmap(photo);
			}
		} else if (resultCode == Activity.RESULT_CANCELED) {
			//User cancelled the media capture
			//TODO implement the action
		}
	}
	private String copyImageInImagesFolder(Bitmap image) {
		String localImagePath = null;
		try {
			String imagesPath = getFilesDir().getAbsolutePath() + "/images";
			File imagesDirectory = new File(imagesPath);
			imagesDirectory.mkdir();
			String filename = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss")
					.format(new Date()) + ".png";
			localImagePath = imagesPath + "/" + filename;
			File localImageFile = new File(localImagePath);
			FileOutputStream outputStream = new FileOutputStream(localImageFile);
			image.compress(Bitmap.CompressFormat.PNG, 100, outputStream);
			outputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return localImagePath;
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
