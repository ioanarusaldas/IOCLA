/* 
 * Description: Simple server implemntation C. Used to illustrate the
 * use of gotos.
 * IOCLA 2019
*/

#include <unistd.h> 
#include <stdio.h> 
#include <sys/socket.h> 
#include <stdlib.h> 
#include <netinet/in.h> 
#include <string.h> 
#define PORT 8080 

int main(void) 
{ 
    int server_fd, new_socket; 
    struct sockaddr_in address; 
    int opt = 1; 
    int addrlen = sizeof(address); 
    char buffer[1024] = {0}; 
    char *hello = "Hello from server"; 

    /*
     *  HINT: use the error buffer for signaling errors;
     *        Do not forget to free it in the end
     *        EXIT_FAILURE and EXIT_SUCCESS are defined in the stdlib
     *        take a look at them and use them accordingaly
     */

    char *error_buffer = malloc(100);

    if (error_buffer == NULL)
    {
      strcpy(error_buffer," Your code for socker creation error");
        goto final;

        /* Your code for socker creation error */

    } 
       
    /* Creating socket file descriptor */
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
    { 
        strcpy(error_buffer," Your code for socker creation error");
        goto final;

		    /* Your code for socker creation error */

    } 
       
    /* Forcefully attaching socket to the port 8080 */
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, 
                                                  &opt, sizeof(opt))) 
    {
      strcpy(error_buffer,"Your code for socket set options error ");
        goto final;

		    /* Your code for socket set options error */

    } 
    address.sin_family = AF_INET; 
    address.sin_addr.s_addr = INADDR_ANY; 
    address.sin_port = htons( PORT ); 
       
    /* Forcefully attaching socket to the port 8080 */
    if (bind(server_fd, (struct sockaddr *)&address,  
                                 sizeof(address))<0) 
    {
      strcpy(error_buffer," Your code for invalid bind ");
        goto final;
		    /* Your code for invalid bind */

    } 
    if (listen(server_fd, 3) < 0) 
    { 
      strcpy(error_buffer," Your code for invalid listen ");
        goto final;

		    /* Your code for invalid listen */

    } 
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address,  
                       (socklen_t*)&addrlen))<0) 
    { 
      strcpy(error_buffer," Your code for invalid accept");
        goto final;

		    /* Your code for invalid accept */

    } 
    read( new_socket , buffer, 1024); 
    printf("%s\n", buffer); 
    send(new_socket , hello , strlen(hello) , 0 ); 
    printf("Hello message sent\n"); 
	
    return 0; 

    /*
     * Label for the error message
     *
     */

final:
  fprintf(stderr,"%s", error_buffer);
    free(error_buffer);


} 
