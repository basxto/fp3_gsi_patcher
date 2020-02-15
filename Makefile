FILENAME=fp3_gsi_patch

$(FILENAME).zip: META-INF/com/google/android/updater-script META-INF/com/google/android/update-binary
	zip -r $@ META-INF/

.PHONY:
flash: $(FILENAME).zip
	adb shell twrp sideload && adb wait-for-sideload && adb sideload $<

.PHONY:
clean:
	rm *.zip