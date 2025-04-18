# Paperless to Markdown Conversion Script

I use [Paperless](https://github.com/paperless-ngx/paperless-ngx) for saving all scanned school newsletters, important mail, etc that comes in my house.  This script was designed for use with any document processing pipeline for preparing documents for use with AI models (or for text based archiving).

## Prerequisites
I'm using [Marker](https://github.com/VikParuchuri/marker) for the conversion process.  You will need to follow their documented installation instructions first -

"You'll need python 3.10+ and PyTorch. You may need to install the CPU version of torch first if you're not using a Mac or a GPU machine. See here for more details.

Install with:
```shell
pip install marker-pdf
```

If you want to use marker on documents other than PDFs, you will need to install additional dependencies with:
```shell
pip install marker-pdf[full]
```

No specific install is required for the script itself.  After installing marker, simply copy/download the `paperless-markdown-conversion.sh` file, modify directory variables as needed, and it should run.


## Usage

1. **Configure Variables:** Edit the script to set the following variables to your desired values:
   * `DIRECTORY`: Input directory containing the document scans.
   * `OUTPUT_DIRECTORY`: Path to the directory where the converted Markdown files will be saved.
   * `LOGFILE`:  Path to the log file.
   * `PROCESSED_LIST`: Path to the file used to track processed files.

2. **Run the Script:** Execute the script from your terminal:

   ```bash
   ./paperless-markdown-conversion.sh