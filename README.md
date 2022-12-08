# express-prisma-boilerplate

Following is an expressjs rest API boilerplate with prisma as ORM. To test locally, create a `.env` file at the root directory and declare an environment variable `DATABASE_URL` as the following format `DATABASE_TYPE://USERNAME:PASSWORD@DATABASE_URL:DATABASE_PORT/DATABASE_NAME`. Then, run the following commands,

```bash
npx prisma generate
npx prisma migrate dev --name init
npx prisma db seed
```

Now, to start the dev server type `npm run dev` or `yarn dev` and the server will start listening at port 3000.

# test using docker

If you don't want to set up DB locally then you can use [docker](https://docs.docker.com/get-docker/) to test the API. Just type `docker compose up` on the CLI and you're server will start listening on port 3000 in no time :)

Thanks for reading...
