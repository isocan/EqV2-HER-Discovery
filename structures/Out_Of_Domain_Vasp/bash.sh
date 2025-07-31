for d in */ ; do
  zip -r "${d%/}.zip" "$d" && rm -rf "$d"
done
