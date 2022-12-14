Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60ABA64D253
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Dec 2022 23:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbiLNWXm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 14 Dec 2022 17:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiLNWXh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Dec 2022 17:23:37 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721D32BB2A
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 14:23:36 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id q6so12780136lfm.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 14:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sw9bdlx8q6flaMAHigpia1xik10R3BxkYaZ+4MWS5Ck=;
        b=Tmz+FwqCNM+ivBZ/MzI7NRDy5eqmPDE1Jlt8p+gjyQDWiFWj7q3yec9QpJ9b09OhMI
         3YSAlv611/JZk/Hi1SGtTaEXqy5h1az0GuWSpcCHIko7yjH4LSLhsARf0piqkR9fkFoG
         FhZyvLlFFfYzhnlW2yzMcUVku0Kyr6l9I3FPSoVWz+oKWiD8feZxIp9If8VG52873ccz
         w+aj16eGDBHPdauWQnqWQo4b24APlsnxzxGNa/hiekMDgGhovJlqjMzFl9CIhR9syhU3
         PQLYZxgVoPyp9Sag7gntJrBEjQRcqgSkl0Qf+E0hzbU9kAzdYxKcaD5KQs8oxAdV5jZC
         2CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sw9bdlx8q6flaMAHigpia1xik10R3BxkYaZ+4MWS5Ck=;
        b=YPOBGfbPvDqlJ1Reem2fUnjA+R0bTWgxV/kzGt7Zx6uJhY2joDL3dAYEPFOF/oBOw7
         5PgLPyXrIDsuuVTj8v86uiR+432kKe/cMstDKynMFuC/mieWgAuEYkyL4TCD83AMktFI
         DVO4ptSRLlGAhkX9nq0v8J/b0CyX25GEfC/2C+ypZDYAcYIg09lnkJuLKfxZeZge1cJz
         zCf7bSHESU6tAa9vvI1BHMvifEaNlKGNCUYkeQxrG8QOPAB9FQKnhgq/l13Op58Pkh3Q
         nJWdgxQN/j7GkTXiN8G+a4znLKoiwxCusJJaMaBcPvS0COOKMexjqYph893OXSv3IwkM
         o/lA==
X-Gm-Message-State: ANoB5pn/HufSGI4JKQprRitOPYNx5VQFQHwgPjef/ddIF4INAWhBXJhC
        +WhNc0/uMFo0yVwmWdeb7hgPvH+afZiX4aXqv2GhuOOjMmBjI2dD
X-Google-Smtp-Source: AA0mqf5pZfUIx2oX+stgCGiopHt8XEu1k4SUWmFGsfgIvJ6vNdaW3V5sYiNHBGvA7m39Ra5Vbxhhemm/DG3m7vyjWpk=
X-Received: by 2002:ac2:4565:0:b0:4b5:2bbc:e121 with SMTP id
 k5-20020ac24565000000b004b52bbce121mr12981654lfm.686.1671056614259; Wed, 14
 Dec 2022 14:23:34 -0800 (PST)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 14 Dec 2022 15:23:22 -0700
Message-ID: <CANLsYkzcC-f7xd5Gi8bEfNRAL+=hAaNGznpBa1Z_M7K7BsM_Zw@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for December 14th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH V4 0/3] rpmsg signaling/flowcontrol patches
[PATCH v2 0/2] Update section header name check
