#include <thread>
#include <cstring>
using namespace std;

thread speakThread;

double SpeakStop() {
    if (speakThread.joinable()) {
        speakThread.detach();
    }
    return 0;
}

void runSpeak(char* input) {
    system(strcat((char*)"espeak ",input));
}

double Speak(char* input) {
    SpeakStop();

    speakThread = thread(runSpeak, input);

    return 0;
}