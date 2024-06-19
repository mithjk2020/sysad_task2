FROM ubuntu:24.04

WORKDIR /cont

COPY src/userGen.sh /cont
COPY src/mentorDetails.txt /cont
COPY src/menteeDetails.txt /cont
COPY src/domainPref.sh /cont
COPY src/mentorAllocation.sh /cont
COPY src/submitTask.sh /cont
COPY src/displayStatus.sh /cont
COPY src/deRegister.sh /cont
COPY src/setQuiz_mentee.sh /cont
COPY src/setQuiz_mentor.sh /cont

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ls -l /cont

RUN chmod +x /cont/userGen.sh && \
    chmod +x /cont/domainPref.sh && \
    chmod +x /cont/mentorAllocation.sh && \
    chmod +x /cont/submitTask.sh && \
    chmod +x /cont/displayStatus.sh && \
    chmod +x /cont/deRegister.sh && \
    chmod +x /cont/setQuiz_mentee.sh && \
    chmod +x /cont/setQuiz_mentor.sh && \
    ./userGen.sh

EXPOSE 80 443

CMD ["tail", "-f", "/dev/null"]
