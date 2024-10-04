A simple Demo GitOps project that involves ArgoCD.
A GitOps project for beginners involves using Git as the source of truth for your infrastructure and application deployment. The idea is that any changes to infrastructure or applications are made by updating a Git repository, and an automated pipeline will ensure that your Kubernetes cluster matches what’s described in the Git repository. Below is a basic GitOps project workflow using Kubernetes, ArgoCD (a GitOps continuous delivery tool), and a simple application.

### Prerequisites:
- Basic understanding of Git, Kubernetes, and YAML
- A GitHub or GitLab repository
- A Kubernetes cluster (you can use Minikube or an EC2 instance with Kubernetes installed)
- ArgoCD installed in your Kubernetes cluster
- Docker installed (optional for creating custom container images)

---

### Step-by-Step GitOps Project for Beginners

#### 1. **Create a Simple Kubernetes Application**

Start by defining a simple Kubernetes application. Let’s say we deploy an Nginx web server. 

Create a Git repository to store your Kubernetes manifests, e.g., `gitops-demo`.

**Directory structure in Git:**

```
gitops-demo/
|-- k8s/
|   |-- deployment.yaml
|   |-- service.yaml
|-- README.md
```

#### a. `deployment.yaml`
This file defines the Nginx deployment with two replicas.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.19.2
        ports:
        - containerPort: 80
```

#### b. `service.yaml`
This file exposes Nginx as a service.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
```

Push these files to your Git repository.

---

#### 2. **Install ArgoCD on Kubernetes Cluster**

ArgoCD will monitor your Git repository and ensure that your Kubernetes cluster stays in sync with what’s described in your repository.

Run the following commands to install ArgoCD:

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Verify the installation:

```bash
kubectl get pods -n argocd
```


#### Troubleshoot #####

Faced issue in accessing the UI , since the argocd-server type is a Cluster-IP(Internal access)

#### 3. **Access the ArgoCD Web UI**

Forward the ArgoCD API server to your localhost so you can access the UI:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Now, access the UI at `https://localhost:8080`.

#### 4. **Login to ArgoCD**

Get the initial admin password:

```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
```

Use the username `admin` and the password from the above command to log in.

---

#### 5. **Connect ArgoCD to Your Git Repository**

Once logged in, you need to create an ArgoCD application that links to your Git repository.

1. In the ArgoCD UI, go to **Applications > New Application**.
2. Provide the following details:
   - **Application Name**: `nginx-app`
   - **Project**: `default`
   - **Sync Policy**: Automatic (so the changes are deployed automatically on every commit)
   - **Repository URL**: The URL of your GitHub/GitLab repo (`https://github.com/username/gitops-demo.git`)
   - **Path**: `k8s/` (the directory in your repository where the manifests are stored)
   - **Cluster URL**: `https://kubernetes.default.svc`
   - **Namespace**: `default`

3. Click **Create**.

---

#### 6. **Sync Application with ArgoCD**

After creating the ArgoCD application, ArgoCD will detect the manifests from your Git repository and deploy them into the Kubernetes cluster.

- If the cluster and the repository state diverge (for example, if you manually make changes in the cluster), ArgoCD will highlight the difference.
- You can click **Sync** to ensure the live state matches the Git repository.

---

#### 7. **Make Changes via GitOps Workflow**

Now, make changes to your application by editing the YAML files in your Git repository.

- **Example Change**: Edit `deployment.yaml` and change `replicas: 2` to `replicas: 3`.
- Commit and push the changes to the Git repository.

ArgoCD will automatically detect the change and apply it to the Kubernetes cluster, increasing the number of Nginx pods from 2 to 3.

---

#### 8. **Monitor and Manage in ArgoCD**

You can monitor the health and synchronization status of your application from the ArgoCD UI. The UI will show:
- The current state of resources
- Any diffs between the live cluster and Git repository
- Application health (e.g., healthy, progressing, degraded)

---

#### 9. **Conclusion**

Congratulations! You’ve set up a basic GitOps pipeline using ArgoCD to deploy an application to a Kubernetes cluster. By using Git as the source of truth, you now have a streamlined, version-controlled, and automated deployment process.

### Further Enhancements:
- **Promote to Staging/Production:** Create separate environments like staging and production using different branches or folders in your Git repository.
- **Add CI/CD Pipelines:** Integrate tools like Jenkins or GitLab CI to automatically build and push images to a container registry before deploying with ArgoCD.
- **Set up Monitoring:** Integrate Prometheus and Grafana to monitor application performance.

---

This project offers an excellent starting point for beginners in the world of GitOps!
