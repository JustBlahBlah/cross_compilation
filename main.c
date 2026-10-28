#include <stdio.h>
#include <stdlib.h>
#include <sys/utsname.h>
#include <time.h>

void get_system_info(char* buffer, size_t size) {
    time_t rawtime;
    struct tm* timeinfo;
    char time_str[64];

    time(&rawtime);
    timeinfo = localtime(&rawtime);
    strftime(time_str, sizeof(time_str), "%Y-%m-%d %H:%M:%S", timeinfo);

    struct utsname sys_info;
    if (uname(&sys_info) != 0) {
        snprintf(buffer, size, "Error: Could not retrieve system information.\n");
        return;
    }

    snprintf(buffer, size,
             "=== System Environment Info ===\n"
             "Hostname:           %s\n"
             "Current Time:       %s\n"
             "OS Name:            %s\n"
             "OS Release:         %s\n"
             "OS Version:         %s\n"
             "Hardware Platform:  %s\n"
             "===============================\n",
             sys_info.nodename, time_str, sys_info.sysname, sys_info.release, sys_info.version,
             sys_info.machine);
}

int main(int argc, char* argv[]) {
    char info_message[1024];

    get_system_info(info_message, sizeof(info_message));

    printf("%s", info_message);

    if (argc >= 2) {
        char* filename = argv[1];

        FILE* check_file = fopen(filename, "r");
        if (check_file != NULL) {
            printf("\n[WARNING] File '%s' already exists. Appending data to the end.\n", filename);
            fclose(check_file);
        }

        FILE* out_file = fopen(filename, "a");
        if (out_file == NULL) {
            perror("Error opening file");
            return 1;
        }

        fprintf(out_file, "%s", info_message);
        fclose(out_file);
        printf("[INFO] Message successfully written to '%s'.\n", filename);
    }

    return 0;
}
