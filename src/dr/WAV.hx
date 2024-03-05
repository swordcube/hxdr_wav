package dr;


// WARNING: This will not have every feature dr_wav has to offer!
//
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxdr_wav/issues

@:include("vendor/include/dr_wav.h")
@:buildXml("<include name=\"${haxelib:hxdr_wav}/include.xml\"/>")
@:unreflective
extern class WAV {
	// can't use RawPointers because those seem to break :[
	@:native('drwav_open_file_and_read_pcm_frames_s16')
	@:noCompletion
	private static function __openFileAndReadPCMFramesShort16(fileName:cpp.ConstCharStar, channels:cpp.RawPointer<cpp.UInt32>, sampleRate:cpp.RawPointer<cpp.UInt32>, totalFrameCount:cpp.RawPointer<cpp.UInt64>, allocationCallbacks:cpp.ConstPointer<DrWavAllocationCallbacks>):cpp.RawPointer<cpp.Int16>;

	static inline function openFileAndReadPCMFramesShort16(fileName:cpp.ConstCharStar, channels:cpp.UInt32, sampleRate:cpp.UInt32, totalFrameCount:cpp.UInt64, allocationCallbacks:cpp.ConstPointer<DrWavAllocationCallbacks>):cpp.RawPointer<cpp.Int16> {
		return __openFileAndReadPCMFramesShort16(fileName, cpp.RawPointer.addressOf(channels), cpp.RawPointer.addressOf(sampleRate), cpp.RawPointer.addressOf(totalFrameCount), allocationCallbacks);
	}

	@:native('drwav_free')
	public extern static function free(data:cpp.RawPointer<cpp.Void>, allocationCallbacks:cpp.ConstPointer<DrWavAllocationCallbacks>):Void;
}

@:keep
@:include("vendor/include/dr_wav.h")
@:buildXml("<include name=\"${haxelib:hxdr_wav}/include.xml\"/>")
@:native('drwav_allocation_callbacks')
@:structAccess
extern class DrWavAllocationCallbacks {
	var userData:cpp.RawPointer<cpp.Void>;

	var onMalloc:cpp.RawPointer<cpp.Void>;
	var onRealloc:cpp.RawPointer<cpp.Void>;
	var onFree:cpp.RawPointer<cpp.Void>;
}