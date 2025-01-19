# Bilingual PDF Book Creator

This project provides a step-by-step guide to create a bilingual PDF book by combining two PDFs. Follow the steps below to generate a dual-language document.

## Steps to create your own Bilingual PDF Book

### Step 1: Find the PDF in the target language

 Identify and download the PDF document.



### Step 2: Translate the PDF

Use the [Online Doc Translator](https://www.onlinedoctranslator.com/en/translationform) to translate your PDF into the target language:


### Step 3: Combine PDFs using PDFtk

 Merge the two PDFs into a single file using the PDFtk tool.

* Install PDFtk if not already installed:
   
   ```bash
   sudo apt install pdftk
   ```


### Step 4: Use an automation script to split and merge pages

* Execute the script:

   ```bash
   awk -f merge.awk pdf1.pdf pdf2.pdf
   ```

This will generate a new file named `combined.pdf`.


### Step 5: Adjust the final bilingual book PDF

Open the `combined.pdf` file.

### View with Document Viewer

Select the following settings:
   - **Dual**
   - **Odd Pages Left**

<p align="center">
<img src="https://github.com/user-attachments/assets/73e6a6dc-0141-482c-9bc2-c145895c6ac3">
</p>     

### View with Google Chrome or Firefox

 Select **Print** and adjust settings:
   - **Pages per Sheet: 2** 

<p align="center">
<img src="https://github.com/user-attachments/assets/204b435d-b260-4809-84c4-c6123a7f5941">
</p>

### Finally!

Now you have your bilingual book ready! You can read it on your phone or Kindle.

<p align="center">
<img src="https://github.com/user-attachments/assets/a631e2c5-be3d-4896-87ff-bd881bbe47ad">
</p>
