#include <pthread.h>
#include <cstring>
#include <stdlib.h>
#include <string>

using namespace std;

#define func extern "C"

pthread_t speakThread;

string input;

func void SpeakStop() {
    pthread_cancel(speakThread);
}

void* runSpeak(void* args) {
    system(input.c_str());
    return NULL;
}

func void Speak(char* inputtext) {
    SpeakStop();
    input = "espeak \"";
    input.append(inputtext);
    input.append("\"");
    pthread_create(&speakThread, NULL, &runSpeak, NULL);
}