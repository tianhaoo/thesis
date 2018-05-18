#### 改了源码

`C:\Bitnami\wampstack-7.1.8-0\apache2\htdocs\thesis\vendor\tcg\voyager\src\Http\Controllers\VoyagerDatabaseController.php`

403行

```
        // Delete Files
        foreach ($dataType->deleteRows->where('type', 'file') as $row) {
            if(isset($data->{$row->field})) {
                foreach (json_decode($data->{$row->field}) as $file) {
                    $this->deleteFileIfExists($file->download_link);
                }
            }
        }
```