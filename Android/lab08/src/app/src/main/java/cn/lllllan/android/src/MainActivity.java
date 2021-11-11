package cn.lllllan.android.src;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class MainActivity extends AppCompatActivity {

    private StringBuilder loadContent = new StringBuilder();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText editContent = (EditText) findViewById(R.id.edit_content);

        Button saveBtn = (Button) findViewById(R.id.button_save);
        saveBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String fileName = ((EditText) findViewById(R.id.edit_file_name)).getText().toString();
                String content = ((EditText) findViewById(R.id.edit_content)).getText().toString();

                if (!isFileNameEmpty()) {

                    try (
                            FileOutputStream out = openFileOutput(fileName, Context.MODE_PRIVATE);
                            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(out))
                    ) {

                        writer.write(content);

                        Toast.makeText(MainActivity.this, "Data have been saved.", Toast.LENGTH_SHORT).show();
                        editContent.setText("");

                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }
            }
        });

        Button loadBtn = (Button) findViewById(R.id.button_load);
        loadBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String fileName = ((EditText) findViewById(R.id.edit_file_name)).getText().toString();
                String content = ((EditText) findViewById(R.id.edit_content)).getText().toString();

                if (isFileNameEmpty()) {
                } else {

                    try (
                            FileInputStream in = openFileInput(fileName);
                            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                    ) {

                        loadContent.delete(0, loadContent.length());
                        String line = "";
                        while ((line = reader.readLine()) != null) {
                            loadContent.append(line);
                        }

                        editContent.setText(loadContent);
                        Toast.makeText(MainActivity.this, "Data have been loaded.", Toast.LENGTH_SHORT).show();
                        
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }
            }
        });
    }

    public boolean isFileNameEmpty() {
        String fileName = ((EditText) findViewById(R.id.edit_file_name)).getText().toString();
        if (fileName.equals("")) {

            AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
            builder.setTitle("Warning");
            builder.setMessage("文件名不能为空");

            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int i) {
                }
            });
            builder.show();

            return true;
        }
        return false;
    }
}