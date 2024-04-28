package dr;


// WARNING: This will not have every feature dr_wav has to offer!
//
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxdr_wav/issues

@:include("vendor/include/dr_wav.h")
@:buildXml("<include name=\"${haxelib:hxdr_wav}/include.xml\"/>")
@:unreflective
extern class WAV {
	@:native('drwav_open_file_and_read_pcm_frames_s16')
	static inline function openFileAndReadPCMFramesShort16(fileName:cpp.ConstCharStar, channels:cpp.UInt32, sampleRate:cpp.UInt32, totalFrameCount:DrWAVUInt64, allocationCallbacks:cpp.RawConstPointer<DrWavAllocationCallbacks>):cpp.RawPointer<cpp.Int16> {
		return untyped __cpp__("drwav_open_file_and_read_pcm_frames_s16({0}, {1}, {2}, {3}, {4})", fileName, cpp.RawPointer.addressOf(channels), cpp.RawPointer.addressOf(sampleRate), cpp.RawPointer.addressOf(totalFrameCount), allocationCallbacks);
	}

	@:native('drwav_free')
	static inline function free(data:Any, allocationCallbacks:cpp.RawConstPointer<DrWavAllocationCallbacks>):Void {
        untyped __cpp__('drwav_free((void*){0}, {1})', data, allocationCallbacks);
    }
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

@:include("vendor/include/dr_wav.h")
@:buildXml("<include name=\"${haxelib:hxdr_wav}/include.xml\"/>")
@:native("drwav_uint64")
@:scalar @:coreType @:notNull
extern abstract DrWAVUInt64 from Int to Int {}