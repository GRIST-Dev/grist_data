pathin='../download/grib/20120526/'
pathou='../download/netcdf/20120526/'
mkdir -p ${pathou}

hres="g6"
cdo_grid_file=${hres}_file_prime_cell.cdo

for file in `ls ${pathin}` ;do

if [ "${file##*.}"x = "grib"x ] ;then

echo ${file}

echo "1) convert grib to netcdf"
cdo -f nc copy ${pathin}/${file} ${pathou}/${file}.tmp.nc
echo "2) convert lat-lon to unstructured"
#cdo remapdis,${cdo_grid_file} ${pathou}/${file}.tmp.nc ${pathou}/${file}.${hres}.nc
cdo remapycon,${cdo_grid_file} ${pathou}/${file}.tmp.nc ${pathou}/${file}.${hres}.nc
echo "3) clean"
rm -rf ${pathou}/${file}.tmp.nc
echo "done"

fi

done
