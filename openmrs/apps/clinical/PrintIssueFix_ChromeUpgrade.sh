patch_file()
{
        filename=$1
        original_md5=$2
        patched_md5=$3

        echo -e '\nPatching '$filename
        echo 'Verifying existing file...'
        current_md5=`md5sum $filename | cut -c 1-32`

        if [[ $current_md5 == $original_md5 ]]; then
                echo 'Making backup of existing file...'
                cp $filename $filename'.backup'

                echo 'Patching file...'
                sed -i 's/<iframe style="display: none"><\/iframe>/<iframe style="visibility: hidden"><\/iframe>/' $filename

                echo 'Verifying patched file...'
                current_md5=`md5sum $filename | cut -c 1-32`

                if [[ $current_md5 == $patched_md5 ]]; then
                        echo 'SUCCESS: File patched successfully: '$filename
                else
                        echo 'ERROR: patched file does not match expected hash: '$current_md5' '$filename
                        exit 1
                fi
        else
                if [[ $current_md5 == $patched_md5 ]]; then
                        echo 'INFO: File already patched: '$filename
                else
                        echo 'ERROR: file to be patched does not match expected hash: '$current_md5' '$filename
                        exit 1
                fi
        fi
}

patch_file /var/www/bahmniapps/clinical/clinical.min.62ed2ef8.js a6d0260119024270e3855423b2b57340 1697bc435f012c9ff1a8247e6a5389b7
patch_file /var/www/bahmniapps/document-upload/document-upload.min.0588cb0d.js 6d3064b925aa9e43b5340263cf50bfb0 7c1906011f0b40539f7cfa3ea9308241
patch_file /var/www/bahmniapps/adt/adt.min.0cf423aa.js d37ca50339d909cd4eaca56769ef0e97 5dc7f33d7cad12870dd7c4311f6a4d72
patch_file /var/www/bahmniapps/registration/registration.min.8a41bffa.js 47030595241772599c5fd277bee861b1 3e37fd809fdc9aca1011daf1678ae4b4
patch_file /var/www/bahmniapps/orders/orders.min.df35426a.js 3e8e6d9c3fa68d81c6a46b11128d6e89 9f4ecba60fb4b2fc8415bf67931d0477
patch_file /var/www/bahmniapps/reports/reports.min.9ea83dee.js 40ec460f2b40e0f80abcd91e16a05346 7a345a933b4a41d4ed970d7124ce4608
