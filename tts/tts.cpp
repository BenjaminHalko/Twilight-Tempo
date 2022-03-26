#define func extern "C" __declspec(dllexport)

#include <sapi.h>
#include <string>
#include <codecvt>
#include <thread>
using namespace std;

ISpVoice* pVoice = NULL;
thread speakThread;

func double SpeakStop() {
    if (pVoice != NULL) {
        pVoice->Release();
        pVoice = NULL;
    }
    return 0;
}

void speakFunction(char* input) {
    HRESULT hr;
    auto a = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED);
    HRESULT CoInitializeEx(LPVOID pvReserved, DWORD dwCoInit);
    hr = CoCreateInstance(CLSID_SpVoice, NULL, CLSCTX_ALL, IID_ISpVoice, (void**)&pVoice);

    if (SUCCEEDED(hr))
    {
        wstring_convert<codecvt_utf8_utf16<wchar_t>> converter;
        hr = pVoice->Speak(converter.from_bytes(input).c_str(), NULL, NULL);
    }
}

func double Speak(char* input) {
    if (speakThread.joinable()) speakThread.detach();
    SpeakStop();
    speakThread = thread(speakFunction,input);
    return 0;
}