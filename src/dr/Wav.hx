package dr;

@:keep
@:include("vendor/include/dr_wav.h")
@:buildXml("<include name=\"${haxelib:hxdr_wav}/include.xml\"/>")

// WARNING: This will not have every feature dr_wav has to offer!
//
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxdr_wav/issues

extern class Wav {
	@:native('drwav_open_file_and_read_pcm_frames_s16')
	public extern static function openFileAndReadPCMFramesShort16(fileName:cpp.ConstCharStar, channels:cpp.Pointer<cpp.UInt32>, sampleRate:cpp.Pointer<cpp.UInt32>, totalFrameCount:cpp.Pointer<cpp.UInt64>, allocationCallbacks:cpp.ConstPointer<DrWavAllocationCallbacks>):cpp.Pointer<cpp.Int16>;

	@:native('drwav_free')
	public extern static function free(data:cpp.Pointer<cpp.Void>, allocationCallbacks:cpp.ConstPointer<DrWavAllocationCallbacks>):Void;
}

@:keep
@:include("vendor/include/dr_wav.h")
@:buildXml("<include name=\"${haxelib:hxdr_wav}/include.xml\"/>")
@:native('drwav_allocation_callbacks')
@:structAccess
extern class DrWavAllocationCallbacks {
	var userData:cpp.Pointer<cpp.Void>;

	var onMalloc:cpp.Pointer<cpp.Void>;
	var onRealloc:cpp.Pointer<cpp.Void>;
	var onFree:cpp.Pointer<cpp.Void>;
}